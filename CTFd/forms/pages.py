from CTFd.forms import BaseForm
from wtforms import (
    BooleanField,
    HiddenField,
    MultipleFileField,
    StringField,
    TextAreaField,
)
from wtforms.validators import InputRequired


class PageEditForm(BaseForm):
    title = StringField(
        "Title", description="This is the title shown on the navigation bar"
    )
    route = StringField(
        "Route",
        description="This is the URL route that your page will be at (e.g. /page). You can also enter links to link to that page.",
    )
    draft = BooleanField("Draft")
    hidden = BooleanField("Hidden")
    auth_required = BooleanField("Authentication Required")
    content = TextAreaField("Content")


class PageFilesUploadForm(BaseForm):
    file = MultipleFileField(
        "Upload Files",
        description="Attach multiple files using Control+Click or Cmd+Click.",
        validators=[InputRequired()],
    )
    type = HiddenField("Page Type", default="page", validators=[InputRequired()])
