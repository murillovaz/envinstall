ENVINSTALL_BIN_DIR="/usr/local/bin" && \
ENVINSTALL_SRC_DIR="/usr/local/src/envinstall" && \
sudo mkdir -p $ENVINSTALL_SRC_DIR && \
sudo wget -O $ENVINSTALL_SRC_DIR/envinstall_log.sh https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall_log.sh && \
sudo wget -O $ENVINSTALL_SRC_DIR/envinstall_programs.sh https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall_programs.sh && \
sudo wget -O $ENVINSTALL_SRC_DIR/envinstall_repositories.sh https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall_repositories.sh && \
sudo wget -O $ENVINSTALL_BIN_DIR/envinstall https://raw.githubusercontent.com/murillovaz/envinstall/main/scripts/envinstall && \
sudo chmod +x $ENVINSTALL_SRC_DIR/envinstall_log.sh && \
sudo chmod +x $ENVINSTALL_SRC_DIR/envinstall_programs.sh && \
sudo chmod +x $ENVINSTALL_SRC_DIR/envinstall_repositories.sh && \
sudo chmod +x $ENVINSTALL_BIN_DIR/envinstall && \
echo "" && \
echo "Envinstall installed. For more details run: envinstall -h"

