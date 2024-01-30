const resourceName = GetCurrentResourceName();

on('dx_tcg:client:createcards', (cardSelection) => {
    generateCards(cardSelection)
});

const getRandomRarity = () => {
    const rarities = [
        'common',
        'uncommon',
        'rare'
    ];

    const weights = {
        'common': 50,
        'uncommon': 30,
        'rare': 10
    };

    const totalWeight = Object.values(weights).reduce((acc, weight) => acc + weight, 0);

    const randomWeight = Math.random() * totalWeight;

    let cumulativeWeight = 0;
    for (const rarity of rarities) {
        cumulativeWeight += weights[rarity];
        if (randomWeight <= cumulativeWeight) {
            return rarity;
        }
    }

    console.log(`[TCG] Couldn't find a rarity for ${randomWeight} / ${totalWeight}`)
    return 'common';
}

function checkChance(chance, label) {
    if (chance < 0 || chance > 100) {
        console.log(`[TCG] Invalid chance: ${chance} for card ${label}`);
        return false;
    }

    const randomValue = Math.random() * 100;

    return randomValue <= chance;
}

const randomInt = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1)) + min;
};

const getRandomCard = (cardsArray, rarity) => {
    const cards = cardsArray.filter(card => card.type === rarity);

    if (cards.length === 0) {
        console.log(`[TCG] Couldn't find a card for rarity ${rarity}`);
        return null;
    }

    const randomIndex = randomInt(0, cards.length - 1);
    return cards[randomIndex];
}

const Delay = (ms) => new Promise(res => setTimeout(res, ms));

const generateCards = (cardSelection) => {
    const cards = [];
    const cardsArray = Config.CARDS[cardSelection];

    if (!cardsArray) {
        console.log(`[TCG] Couldn't find card selection ${cardSelection}`);
        return null;
    }

    for (let i = 0; i < 6; i++) {
        const rarity = getRandomRarity();
        const card = getRandomCard(cardsArray, rarity);
        const canBeHolo = checkChance(card.chanceBeHolo, card.label);
        cards.push({
            img: card.image,
            label: card.label,
            type: card.type,
            holo: canBeHolo,
            season: cardSelection
        });
    }

    exports[resourceName].SendReactMessage('dx_tcg:ui:openTradingCardPack', {
        cards: cards
    });
}

const initJS = async () => {
    await Delay(1000);
    exports[resourceName].SendReactMessage('dx_tcg:ui:init', {
        language: Config.LANGUAGE
    });
}

initJS();