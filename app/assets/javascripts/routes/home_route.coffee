# ==========================================================================
# Home Route
# ==========================================================================
# Provides the model for the home dashboard.
#

EventKit.HomeRoute = Em.Route.extend EventKit.ResetScroll, {
	model: ()->
		now = new Date()
		yesterday = Math.floor(now.getTime() / 1000) - (24 * 60 * 60)
		EventKit.DashboardModel.create({
			recent: @store.find('event', {
				limit: 10
				offset: 0
				descending: 1
				sortby: 'timestamp'
			})

			today: @store.find('event', {
				since: yesterday
			})

			open: @store.find('event', {
				event: 'open'
			})

			click: @store.find('event',  {
				event: 'click'
			})

			bounce: @store.find('event', {
				event: 'bounce'
			})

			processed: @store.find('event', {
				event: 'processed'
			})

			deferred: @store.find('event', {
				event: 'deferred'
			})

			delivered: @store.find('event', {
				event: 'delivered'
			})

			dropped: @store.find('event', {
				event: 'dropped'
			})

			spamreport: @store.find('event', {
				event: 'spamreport'
			})
		})
}