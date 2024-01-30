if um.lang ~= 'fr' then return end

Lang = {}

Lang.UI = {
    main = {
        spawn = 'APPARAÎTRE',
        last = {
            first = 'Dernier',
            second = 'Emplacement',
            words = 'Rappelez-vous, peu importe où vous êtes né, le plus important est de réussir.'
        },
        my = 'Mon',
        back = 'Retour'
    },
    menu = {
        map = 'Carte',
        apart = 'Appartements',
        house = 'Maisons',
        bookmarks = 'Signets',
        cinematic = 'Cinématique'
    },
    rent = {
        title = 'Sélectionner des Appartements',
        button = 'Louer une chambre d’appartement'
    },
}

Lang.Bookmark = {
    input = {
        title = 'Ajouter un Emplacement',
        first = {
            name = 'Nom de l’Emplacement',
            desc = 'Nommez votre emplacement spécial'
        },
        second = {
            name = 'Image de l’Emplacement (URL)',
            desc = 'Insérez un lien d’image ici | seulement (discord ou imgur)'
        },
    },
    dialog = {
        header = 'Paiement des Signets',
        content = 'Acceptez-vous de payer %s$ pour ajouter cet emplacement à vos signets ?'
    },
    error = {
        title = 'Signets',
        link = 'Seulement lien discord ou imgur',
        money = 'Vous n’avez pas assez d’argent'
    }
}