ENVINSTALL_BIN_DIR="/usr/local/bin" && \
ENVINSTALL_SRC_DIR="/usr/local/src/envinstall" && \
sudo mkdir -p $ENVINSTALL_SRC_DIR && \
sudo wget -O https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall_log.sh -P $ENVINSTALL_SRC_DIR && \
sudo wget -O https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall_programs.sh -P $ENVINSTALL_SRC_DIR && \
sudo wget -O https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall_repositories.sh -P $ENVINSTALL_SRC_DIR && \
sudo wget -O https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall -P $ENVINSTALL_BIN_DIR && \
sudo chmod +x $ENVINSTALL_SRC_DIR/envinstall_log.sh && \
sudo chmod +x $ENVINSTALL_SRC_DIR/envinstall_programs.sh && \
sudo chmod +x $ENVINSTALL_SRC_DIR/envinstall_repositories.sh && \
sudo chmod +x $ENVINSTALL_BIN_DIR/envinstall && \
echo "" && \
echo "Envinstall installed. For more details run: envinstall -h"

