#! /bin/sh

rec_rmdir () (

if [ $# -ne 1 ]
then
	echo "Erreur : Il doit y avoir 1 ET 1 SEUL argument\n"
	return
fi

echo "Argument : $1"

if test -d $1
then
	cd $1
	pwd
else
	echo "Erreur : L'argument doit ètre un repertoire\n"
	return
fi

for i in *
do
	if test -d $i
then
	echo "Repertoire trouvé : $i\n"
	rec_rmdir $i
	rmdir $i
	fi
done

)
rec_rmdir $1

exit 0