Template.adminPagesSort.helpers
	icon: ->
		collectionName = Session.get 'admin_collection_name'
		if collectionName and AdminPages[collectionName]
			sort = AdminPages[collectionName].getSort()
			if typeof sort[@field] == 'undefined'
				false
			else
				if sort[@field] == 1 then 'caret-up' else 'caret-down'

Template.adminPagesSort.events
	'click .admin_pages_sort': (e) ->
		collectionName = Session.get 'admin_collection_name'
		if collectionName and AdminPages[collectionName]
			sort = AdminPages[collectionName].getSort()
			if sort[@field] == -1
				delete sort[@field]
			else
				sort[@field] = if sort[@field] == 1 then -1 else 1
			AdminPages[collectionName].setSort sort