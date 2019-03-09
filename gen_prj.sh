while getopts "n:" opt; do
    case $opt in
        n)
            PROJECT_NAME=$OPTARG
        \?)
            echo "script usage: $(basename $0) -n name" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if [ -z "$PROJECT_NAME" ]
then
    echo "ERROR: The project name not specified."
    exit 1
fi

if [ -d "$PROJECT_NAME" ]
then
    echo "ERROR: The project dir already exists."
    exit 1
fi

mkdir $PROJECT_NAME

touch $PROJECT_NAME/$PROJECT_NAME

echo "![output](output.png)" > $PROJECT_NAME/README.md
