from CTFd.models import Comments, ma
from CTFd.schemas.users import UserSchema
from marshmallow import fields


class CommentSchema(ma.ModelSchema):
    class Meta:
        model = Comments
        include_fk = True
        dump_only = ("id", "date", "html", "author", "author_id", "type")

    author = fields.Nested(UserSchema(only=("name",)))
    html = fields.String()
