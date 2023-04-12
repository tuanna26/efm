FILE = 
RECIPIENT = quannd@reactplus.jp

EN_FILE_NAME = $(basename $(FILE))
EN_FILE_EXT = $(suffix $(FILE))

DE_FILE_NAME = $(word 1,$(subst ., ,$(FILE)))
DE_FILE_EXT = $(word 2,$(subst ., ,$(FILE)))

debug:
	$(info DE_FILE_NAME: $(DE_FILE_NAME))
	$(info DE_FILE_EXT: $(DE_FILE_EXT))


encrypt: $(FILE).gpg
	@echo "Encrypted file"

$(FILE).gpg: $(FILE)
	@gpg -o $(EN_FILE_NAME)$(EN_FILE_EXT).gpg -e -r $(RECIPIENT) $(FILE)

decrypt: $(DE_FILE_NAME).$(DE_FILE_EXT)
	@if [ "$(DE_FILE_EXT)" = "txt" ] || [ "$(DE_FILE_EXT)" = "json" ]; then \
		echo "Content of file:"; \
		echo; \
		cat $(DE_FILE_NAME).$(DE_FILE_EXT); \
		echo; \
		rm  $(DE_FILE_NAME).$(DE_FILE_EXT); \
	else \
		echo "Decrypted file"; \
	fi

$(DE_FILE_NAME).$(DE_FILE_EXT): $(DE_FILE_NAME).$(DE_FILE_EXT).gpg
	@gpg -o $(DE_FILE_NAME).$(DE_FILE_EXT) -u $(RECIPIENT) -d $(DE_FILE_NAME).$(DE_FILE_EXT).gpg

protect: encrypt
	@rm $(FILE)
	@mv $(FILE).gpg secure_files/
	@git add secure_files/$(FILE).gpg
	@git commit -m "Encrypt and save $(FILE).gpg"
	@git push

show_secret: 
	@cp secure_files/$(FILE) .
	@make decrypt FILE=$(FILE)
	@rm $(FILE)

list_secret:
	@ls secure_files/.

remove_secret:
	@rm secure_files/$(FILE)
	@git add .
	@git commit -m "Delete $(FILE).gpg"
	@git push


.PHONY: encrypt decrypt debug protect show_secret list_secret remove_secret
