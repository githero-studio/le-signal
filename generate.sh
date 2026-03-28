#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

# Init repo if needed
if [ ! -d ".git" ]; then
    git init
    git checkout -b main
fi

git add -A
git commit -m "init: book metadata"

# === MAIN BRANCH ===

git commit --allow-empty -m "$(cat <<'EOF'
Le terminal s'allume dans le noir. Pas de prompt, pas de message d'accueil. Juste un curseur vert qui clignote sur fond noir, comme une respiration mécanique dans le silence de l'open space désert.

Il est 2h47 du matin. Tu es resté pour finir un merge qui refusait de passer. Le café a refroidi depuis longtemps. La lumière des néons du couloir projette des ombres géométriques sur les bureaux vides. Ton écran est la seule source de lumière.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Un commit apparaît dans le log. Tu n'as rien poussé. Personne n'a accès à ce repo à part toi. Le SHA commence par sept zéros — 0000000 — ce qui est statistiquement impossible. L'auteur est listé comme « unknown ».

Tu rafraîchis. Le commit est toujours là. Tu vérifies les remotes, les hooks, les actions GitHub. Tout est normal. Mais ce commit existe, et il n'a aucune raison d'exister. Tu sens tes doigts se crisper sur le clavier.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Le message du commit ne contient qu'une seule ligne. Pas de description, pas de co-auteur, pas de référence à une issue. Juste deux nombres séparés par une virgule : 48.8566, 2.3522.

Tu les reconnais immédiatement. Ce sont des coordonnées GPS. Tu les as vues assez souvent dans les tests de géolocalisation de l'app que tu développes. Mais celles-ci pointent vers un endroit précis. Très précis. Et tu ne sais pas encore pourquoi ça te donne froid dans le dos.

Ton cœur tape. Le bureau est vide, le couloir est sombre, et tu as devant toi un commit qui n'a aucune raison d'exister. Une partie de toi veut creuser — ouvrir Maps, tracer l'adresse, comprendre qui a fait ça et pourquoi. L'autre partie pense à Alex, ton tech lead, qui dort sûrement avec son téléphone sous l'oreiller. Il saurait quoi faire. Mais si tu en parles, tu ne pourras plus faire comme si ça n'était rien.
EOF
)"

# === DIVERGENCE POINT: coordonnées GPS ===
# Trois branches partent de ce commit :
# - feature/investigate (enquêter sur les coordonnées)
# - fix/alert-team (alerter l'équipe)
# Les deux passent par ce point.
DIVERGE_COORDINATES=$(git rev-parse HEAD)

git commit --allow-empty -m "$(cat <<'EOF'
Tu restes devant l'écran. Les secondes passent. Tu relis les coordonnées une troisième fois, comme si elles allaient changer. Elles ne changent pas. Mais au bout de trente secondes exactement, le commit disparaît du log.

Pas supprimé — disparu. Comme s'il n'avait jamais existé. git reflog ne montre rien. L'historique est propre. Tu vérifies le hash dans .git/objects : le dossier est vide. Tu commences à douter de ce que tu as vu.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Le lendemain matin, tu arrives au bureau avec les yeux rouges et un café double. Tu ouvres ton terminal par réflexe. Le repo est normal. Aucune trace du commit fantôme. Tu vérifies sur GitHub : rien. Tu cherches dans les logs serveur : rien.

En fin de journée, tu découvres que le repo a été supprimé. Pas archivé — supprimé. L'URL renvoie une 404. Le propriétaire du repo, c'est toi. Mais tu ne l'as pas supprimé. Et les backups quotidiens de cette nuit-là sont corrompus.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Les jours passent. Tu n'en parles à personne. Qu'est-ce que tu dirais, de toute façon ? « J'ai vu un commit impossible à 3h du matin dans un repo qui n'existe plus » ? On te demanderait combien de cafés tu as bus.

Tu te convaincs que c'était un bug. Un artefact de fatigue et de cache DNS. Tu reprends ton travail normal. Tu livres tes features. Tu fais tes code reviews. Et tu essaies de ne pas penser au fait que les coordonnées 48.8566, 2.3522 pointent exactement vers le café où tu prends ton déjeuner chaque midi.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Le silence revient. Tu fermes les yeux, les mains à plat sur le bureau. Le ronronnement du ventilateur du serveur est le seul bruit dans la pièce. Tu te demandes si tout ça n'était qu'un rêve, un bug dans ta propre mémoire.

Mais quand tu rouvres les yeux, ton terminal affiche une dernière ligne que tu n'as pas tapée : « À bientôt. » Le curseur clignote deux fois, puis l'écran s'éteint.
EOF
)"

# === BRANCHE feature/investigate ===
# Diverge depuis le commit des coordonnées GPS
git checkout -b feature/investigate $DIVERGE_COORDINATES

git commit --allow-empty -m "$(cat <<'EOF'
Tu ouvres Google Maps. Tes doigts tremblent légèrement quand tu tapes les coordonnées. 48.8566, 2.3522 — Paris, quatrième arrondissement. Pile au centre géographique de la ville. Le marqueur se pose sur l'Île de la Cité, à deux pas de Notre-Dame.

Tu zoomes. Street View montre une rue pavée, un lampadaire en fer forgé, et l'entrée d'un petit café dont tu ne vois pas le nom. L'image date de juin dernier. Un homme en imperméable est assis en terrasse, le visage tourné vers la caméra. On dirait qu'il regarde droit dans l'objectif.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Tu croises les données. Le café s'appelle « Le Terminal ». L'ironie te fait grimacer. Tu vérifies les horaires : ouvert de 7h à 22h, fermé le dimanche. Les avis Google sont tièdes — café correct, wifi instable, pas de prises électriques.

Mais c'est le détail du commit qui te hante : la date. Tu la relis dans tes notes. Le commit était daté de demain. Pas d'hier, pas d'il y a trois jours. Demain. Un commit venu du futur, dans un repo qui n'existe plus, pointant vers un café que tu n'as jamais visité. Tu fermes le navigateur. Tu le rouvres.

Tu fixes l'adresse du Terminal sur ton écran. Tu pourrais y aller. Prendre le train, t'asseoir en terrasse, voir si quelqu'un t'attend — ou si quelque chose t'attend. Mais une voix dans ta tête murmure autre chose : efface tout. Vide le cache, purge les notes, rm -rf et on n'en parle plus. Parce que si ce commit vient vraiment du futur, peut-être que ce que tu vas trouver là-bas ne devrait jamais être trouvé.
EOF
)"

# === DIVERGENCE POINT: le café ===
# hotfix/delete-evidence diverge d'ici
DIVERGE_CAFE=$(git rev-parse HEAD)

git commit --allow-empty -m "$(cat <<'EOF'
Tu décides d'y aller. C'est irrationnel et tu le sais. Mais le pire qui puisse arriver, c'est de boire un mauvais café sur l'Île de la Cité. Le TGV part de la gare en deux heures. Tu prends ton sac, ton laptop, et ton chargeur.

Dans le train, tu essaies de travailler. Impossible. Tu relis tes notes sur le commit, les coordonnées, le SHA impossible. Tu dessines le graphe sur un carnet : un seul nœud, sans parent, sans enfant. Un commit orphelin dans un repo orphelin. L'aberration parfaite.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Le café est exactement comme sur Street View. Les pavés, le lampadaire, la terrasse. Il est 14h, l'endroit est presque vide. Tu t'assieds à la table la plus proche de la porte, dos au mur, face à l'entrée — vieux réflexe de paranoïaque.

Tu commandes un allongé. La serveuse te regarde bizarrement quand tu lui demandes si quelqu'un a laissé quelque chose pour toi. Elle hausse les épaules. Tu attends. Puis, en te levant pour aller aux toilettes, tu sens quelque chose sous la table. Une enveloppe kraft, scotchée au bois avec du gaffer noir. Elle était là avant toi.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Tu ouvres l'enveloppe dans le train du retour, les mains moites. Dedans : une clé USB noire, sans marque, 8 Go. Et un post-it jaune plié en deux. L'écriture est fine, appliquée, au stylo-plume bleu. Quatre mots : « git pull origin truth ».

Tu branches la clé sur ton laptop. Elle contient un seul fichier : un repo git compressé. Tu le décompresses dans /tmp. Le repo contient un historique de 347 commits, répartis sur 12 branches. Les messages sont des fragments de texte sans contexte apparent. Le dernier commit est daté d'aujourd'hui. Et l'auteur de chaque commit, c'est toi.
EOF
)"

# Retour sur main pour la branche suivante
git checkout main

# === BRANCHE fix/alert-team ===
# Diverge depuis le commit des coordonnées GPS
git checkout -b fix/alert-team $DIVERGE_COORDINATES

git commit --allow-empty -m "$(cat <<'EOF'
Tu ne peux pas garder ça pour toi. C'est trop gros, trop bizarre, trop précis pour être un accident. Tu ouvres Slack et tu envoies un DM à Alex, ton tech lead. Tu lui envoies le SHA, les coordonnées, une capture d'écran du log que tu as eu le réflexe de faire avant que tout disparaisse.

Le message est envoyé. Le double check bleu apparaît — lu. Puis rien. Pas de réponse. Pas de « wtf ». Pas de « t'as bu quoi ». Juste le silence. Tu attends cinq minutes, dix minutes, une heure. L'indicateur Slack d'Alex passe de vert à gris. Déconnecté.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Le lendemain matin, le compte GitHub d'Alex est désactivé. Pas suspendu, pas archivé — désactivé. Sa page profil renvoie une 404. Ses repos ont disparu. Ses contributions sur le graphe d'activité : effacées. Comme s'il n'avait jamais existé sur la plateforme.

Tu essaies de l'appeler. Messagerie directe. Tu envoies un mail — bounce. Tu passes devant son bureau : il est vide. Propre. Pas « rangé » propre, mais « jamais utilisé » propre. La RH te regarde bizarrement quand tu demandes des nouvelles : « Alex qui ? On n'a personne de ce nom dans l'équipe. »
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Tu retournes à ton poste, les mains glacées. Tu ouvres GitHub. Le repo fantôme est de retour. Il a changé de nom, mais l'URL est la même. Et cette fois, il a trois collaborateurs. Leurs avatars sont des carrés gris par défaut, sans photo. Leurs pseudos sont des hashes tronqués.

Le troisième collaborateur, c'est toi. Ton vrai compte. Ton avatar, ton pseudo, ta bio. Tu n'as jamais accepté d'invitation. Tu n'as aucune notification. Mais tu es là, listé comme « maintainer » d'un repo dont tu ne connais pas le contenu. Et le dernier commit, poussé il y a sept minutes, porte ton nom.
EOF
)"

# Retour sur main pour la branche suivante
git checkout main

# === BRANCHE hotfix/delete-evidence ===
# Diverge depuis feature/investigate au niveau du café
git checkout -b hotfix/delete-evidence $DIVERGE_CAFE

git commit --allow-empty -m "$(cat <<'EOF'
Non. Tu ne veux pas savoir. Quoi que ce soit, ça ne te concerne pas. Tu refermes le navigateur, tu vides le cache, tu supprimes l'historique. Puis tu ouvres le terminal et tu tapes la commande que tu connais par cœur : rm -rf. Pas de corbeille, pas de confirmation.

Le repo local disparaît en 0.3 secondes. Tu vérifies avec find : plus aucun fichier .git sur tout le disque. Tu respires. C'est fini. C'était un bug, un glitch, un mauvais rêve de développeur en burn-out. Tu fermes le laptop.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Le lendemain, tu changes ton mot de passe GitHub. 32 caractères, généré par le gestionnaire de mots de passe. Tu actives la 2FA par clé physique. Tu révoques tous les personal access tokens — il y en avait sept, certains dataient de trois ans.

Tu audites tes SSH keys. Tu en supprimes quatre sur six. Tu vérifies les sessions actives : une seule, la tienne, depuis ton IP fixe. Tout est normal. Tu te sens comme un idiot en train de barricader sa maison après un cauchemar. Mais au moins, tu dors mieux cette nuit-là.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Trois jours passent sans incident. Le code tourne. Les sprints avancent. Tu fais une PR qui reçoit trois approvals en vingt minutes. Le stand-up du mardi est le plus court de l'année : huit minutes, tout le monde est content.

Tu commences à oublier. Le commit fantôme devient une anecdote que tu te racontes à toi-même en souriant, un bug amusant que tu mentionneras peut-être un jour dans un talk sur les edge cases de git. Le café au coin de la rue redevient un simple café. Les coordonnées GPS redeviennent des nombres.
EOF
)"

git commit --allow-empty -m "$(cat <<'EOF'
Vendredi soir. Tu fermes ton laptop à 18h pour la première fois depuis des semaines. Tu prends ta veste, tu éteins l'écran externe, tu mets tes écouteurs. En passant devant le bureau vide de ton collègue, tu jettes un œil machinal à son écran resté allumé.

Un terminal est ouvert. Un git log est affiché. Et au milieu de l'historique, un commit avec un SHA qui commence par 0000001. Le message ne contient qu'un seul mot : « Trop tard. » L'auteur est listé comme « unknown ». La date est celle d'aujourd'hui. De maintenant. Tu sens tes jambes fléchir.
EOF
)"

# Retour sur main
git checkout main

echo "=== Génération terminée ==="
echo "Branches créées :"
git branch
echo ""
echo "Commits sur main :"
git log main --oneline
echo ""
echo "Commits sur feature/investigate :"
git log feature/investigate --oneline
echo ""
echo "Commits sur fix/alert-team :"
git log fix/alert-team --oneline
echo ""
echo "Commits sur hotfix/delete-evidence :"
git log hotfix/delete-evidence --oneline
