enum FirestoreCollectionNames {
    Users,
    Profile,
    Notification,
}

extension FirestoreCollectionNamesExtension on FirestoreCollectionNames {
    String get name => describeEnum(this);

    String describeEnum(Object enumEntry) {
        final String description = enumEntry.toString();
        final int indexOfDot = description.indexOf('.');
        assert(indexOfDot != -1 && indexOfDot < description.length - 1);
        return description.substring(indexOfDot + 1);
    }

    String get displayTitle {
        switch (this) {
            case FirestoreCollectionNames.Users:
                return "users";
            case FirestoreCollectionNames.Profile:
                return "user_profile";
            case FirestoreCollectionNames.Notification:
                return "notifications";
            default:
                return "users";
        }
    }
}
