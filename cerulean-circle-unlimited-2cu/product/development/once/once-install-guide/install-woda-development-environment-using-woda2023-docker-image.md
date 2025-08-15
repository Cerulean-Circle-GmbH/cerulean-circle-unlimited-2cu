[📁 Once Install Guide](../once-install-guide.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000078/install-woda-development-environment-using-woda2023-docker-image.md) | [🌐 Page Structure local SymLink](./install-woda-development-environment-using-woda2023-docker-image.page.md)

# Install WODA development environment using WODA.2023 docker image

# Download and start container

Go to [https://github.com/Cerulean-Circle-GmbH/WODA.2023](https://github.com/Cerulean-Circle-GmbH/WODA.2023) and do the steps in the README.

Video → [https://drive.google.com/file/d/1jUXsPgEfBI-UbGUkYWXDkZKDNJAyEZdZ/view?usp=share\_link](https://drive.google.com/file/d/1jUXsPgEfBI-UbGUkYWXDkZKDNJAyEZdZ/view?usp=share_link)

> [!TIP]
> - Now arm64 (Mac) and amd64 images are available.
> - Your personal SSH key is automatically integrated if located correctly
> - Your git name and email is automatically integrated if located correctly
> - The source code in `/var/dev/EAMD.ucp` is in a separate volume or in a directory you can choose.
>   - Restarting and recreating the container → changes will be preserved
>   - Deleting the volume `once_once-development` → changes will be lost
>   - Only on MAC or Linux you could map a local directory instead of the volume
