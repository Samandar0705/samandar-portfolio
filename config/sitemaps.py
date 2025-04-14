from django.contrib.sitemaps import Sitemap
from django.urls import reverse

class StaticViewSitemap(Sitemap):
    priority = 1.0
    changefreq = 'daily'

    def items(self):
        return ['index', 'about', 'services', 'portfolio', 'contact_us', 'blog', 'single_blog' ]  # bu sizning url name’laringiz

    def location(self, item):
        return reverse(item)
