if [ -z $1 ]; then
    echo "No DPI."
    exit 1
fi

echo "Xft.dpi: $1" | xrdb -override -

